package publisher.rest.controller;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.stream.Collectors;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

import javax.servlet.MultipartConfigElement;
import javax.servlet.http.Part;

import com.google.gson.JsonObject;

import publisher.rest.exception.InvalidRequestException;
import publisher.rest.model.HtmlView;
import publisher.rest.service.DAOService;
import publisher.rest.service.HtmlViewsService;
import spark.Request;
import spark.Response;
import spark.Route;

public class HtmlViewsController {

	public static HtmlViewsService service = new HtmlViewsService();

	public static final Route list = (Request request, Response response) -> {
		response.type("application/json");
		response.status(200);
		return service.getAll().parallelStream().map(dom -> DAOService.toJson(dom)).map(elem -> elem.toString())
				.collect(Collectors.toList());

	};

	public static final Route get = (Request request, Response response) -> {
		String id = fetchId(request);
		response.status(200);
		response.type("application/json");
		return DAOService.toJson(service.get(id));
	};

	/*
	public static final Route update = (Request request, Response response) -> {
		response.status(200);
		response.type("application/json");

		JsonObject view = DAOService.castToJson(request.body());
		if(!view.has("render"))
			throw new InvalidRequestException("view must have a mandatory key 'render'");
		String renderId = view.remove("render").getAsString();
		HtmlView htmlView = (HtmlView) DAOService.fromJson(view.toString(), HtmlView.class);
		boolean route = service.update(htmlView.getId(), htmlView, renderId);
		if(!route) {
			return DAOService.toJson(route);
		}else {
			response.status(201);
			return "";
		}
	};
	*/
	public static final Route update = (Request request, Response response) -> {
	    response.type("application/json");

	    // Necesario para que Spark/Jetty procese multipart/form-data
	    request.attribute("org.eclipse.jetty.multipartConfig", new MultipartConfigElement("/tmp"));

	    try {
	        String id = request.raw().getParameter("id");
	        String renderId = request.raw().getParameter("render");

	        if (renderId == null || renderId.isBlank()) {
	            throw new InvalidRequestException("view must have a mandatory key 'render'");
	        }

	        Part filePart = request.raw().getPart("templateFile");

	        String uploadedFileName = null;

	        if (filePart != null && filePart.getSize() > 0) {
	            uploadedFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

	            // Carpeta destino en servidor remoto
	            Path uploadDir = Paths.get("./views");
	            Files.createDirectories(uploadDir);

	            Path targetFile = uploadDir.resolve(uploadedFileName);

	            try (InputStream input = filePart.getInputStream()) {
	                Files.copy(input, targetFile, StandardCopyOption.REPLACE_EXISTING);
	            }
	        }

	        HtmlView htmlView = new HtmlView();
	        //htmlView.setId(id);

	        // Aquí decides qué guardar en template:
	        // - el nombre del fichero
	        // - la ruta relativa
	        // - la ruta absoluta
	        if (uploadedFileName != null) {
	            htmlView.setTemplate(uploadedFileName);
	        }

	        boolean route = service.update(htmlView.getId(), htmlView, renderId);

	        if (!route) {
	            response.status(200);
	            return DAOService.toJson(false);
	        } else {
	            response.status(201);
	            return DAOService.toJson(true);
	        }

	    } catch (Exception e) {
	        response.status(500);
	        JsonObject error = new JsonObject();
	        error.addProperty("error", e.getMessage());
	        return error.toString();
	    }
	};
	
	

	public static final Route remove = (Request request, Response response) -> {
		String id = fetchId(request);
		if (service.exist(id)) {
			service.delete(id);
			response.status(200);
		} else {
			response.status(404);
		}
		return "";
	};






	protected static final String fetchId(Request request) {
		String id = request.params("id");
		if (id == null || id.isEmpty())
			throw new InvalidRequestException("Provided id can not be blank or null");
		return id;
	}
}
