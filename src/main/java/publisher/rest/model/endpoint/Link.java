package publisher.rest.model.endpoint;

import java.net.URL;
import java.net.URLConnection;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonSubTypes.Type;
import com.fasterxml.jackson.annotation.JsonTypeInfo;

import jakarta.persistence.Entity;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import publisher.rest.exception.EndpointRemoteDataException;
import publisher.rest.exception.InvalidRequestException;
import spark.Request;

@Entity
@JsonInclude(Include.NON_NULL)
@JsonTypeInfo(use = com.fasterxml.jackson.annotation.JsonTypeInfo.Id.NAME)
@JsonSubTypes({ @Type(TriplestoreDescribe.class), @Type(SPARQL.class),  @Type(TriplestoreSparql.class), })
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class Link extends AbstractEndpoint {


	@NotBlank
	@NotNull
	@JsonProperty
	protected String url;


	public Link() {
		super();
	}

	public Link(String name, String url, EndpointFormat format) {
		super();
		this.name = name;
		this.url = url;
		this.format = format;
	}


	@Override
	public String getUrl() {
		return url;
	}

	@Override
	public void setUrl(String url) {
		try {
			new URL(url);
		}catch(Exception e) {
			throw new InvalidRequestException("Provided URL ("+url+") is not a valid URL");
		}
		this.url = url;
	}


	@Override
	public String getData(Request request) throws EndpointRemoteDataException{
		try {
			String arguments = request.queryString();
			boolean hasArguments = this.url.contains("?");
			URL url = new URL(this.url);
			if(arguments!=null) {
				url = new URL(this.url+"?"+arguments);
				if(hasArguments)
					url = new URL(this.url+"&"+arguments);
			}
			URLConnection urlConnection = url.openConnection();
			String output = new String(urlConnection.getInputStream().readAllBytes());

			return output;
		} catch (Exception e) {
			throw new EndpointRemoteDataException(e.toString());
		}
	}

	@Override
	public String testData(Request request) throws EndpointRemoteDataException {
		try {
			this.status = EndpointStatus.VALID;
			return getData(request);
		} catch (Exception e) {
			this.status = EndpointStatus.INVALID;
			throw new EndpointRemoteDataException(e.toString());
		}

	}







}
