package publisher;

import publisher.rest.ServiceConfiguration;
import publisher.rest.ServicePublisher;
import publisher.rest.controller.ViewRendererController;

public class Publisher  {

	// -- Main
	public static final String CONFIG_PORT_ARGUMENT = "-config.port=";
	public static final String PUBLISHER_PORT_ARGUMENT = "-publisher.port=";
	public static final String DEMON_ARGUMENT = "-d";
	public static int CONFIG_PORT = 4567;
	public static int PUBLISHER_PORT = 9000;
	public static String VERSION = "v4.0.1";

	public static void main(String[] args) {
		// Configuration
		configure(args);
		Publisher.startServices();
		System.out.println(LOGO);
		System.out.println("Configuration service running on " + "http://localhost:" + CONFIG_PORT);
		System.out.println("Publisher service running on " + "http://localhost:" + PUBLISHER_PORT);
		ServiceConfiguration.openInBrowser();

	}

	public static void startServices() {
		try {
		// Run services
		ServiceConfiguration.runConfigurationMode(CONFIG_PORT);
		System.out.println("Configuration service up!");
		ServicePublisher.runPublishMode(PUBLISHER_PORT);
		System.out.println("Publishing service up!");
		// Mock data
		//StaticPersistence.updateMockData();
		//System.out.println("Mocking some data");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected static final String LOGO = "\n" +
	          "  ██╗  ██╗███████╗██╗     ██╗ ██████╗                                 \n"
			+ "  ██║  ██║██╔════╝██║     ██║██╔═══██╗                                \n"
			+ "  ███████║█████╗  ██║     ██║██║   ██║                                \n"
			+ "  ██╔══██║██╔══╝  ██║     ██║██║   ██║                                \n"
			+ "  ██║  ██║███████╗███████╗██║╚██████╔╝                                \n"
			+ "  ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝ ╚═════╝                                 \n"
			+ "  ██████╗ ██╗   ██╗██████╗ ██╗     ██╗███████╗██╗  ██╗███████╗██████╗ \n"
			+ "  ██╔══██╗██║   ██║██╔══██╗██║     ██║██╔════╝██║  ██║██╔════╝██╔══██╗\n"
			+ "  ██████╔╝██║   ██║██████╔╝██║     ██║███████╗███████║█████╗  ██████╔╝\n"
			+ "  ██╔═══╝ ██║   ██║██╔══██╗██║     ██║╚════██║██╔══██║██╔══╝  ██╔══██╗\n"
			+ "  ██║     ╚██████╔╝██████╔╝███████╗██║███████║██║  ██║███████╗██║  ██║\n"
			+ "  ╚═╝      ╚═════╝ ╚═════╝ ╚══════╝╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝\n"
			+ "                                                              "+VERSION+"  \n"
			+ "                                                          \n" + "";

	private static void configure(String[] args) {
		// create ViewRenderer
		ViewRendererController.init();
		try {
			for (String argument : args) {
				if (argument != null && !argument.isBlank()) {
					if (argument.contains(PUBLISHER_PORT_ARGUMENT)) {
						PUBLISHER_PORT = Integer.valueOf(argument.replace(PUBLISHER_PORT_ARGUMENT, ""));
					} else if (argument.contains(CONFIG_PORT_ARGUMENT)) {
						CONFIG_PORT = Integer.valueOf(argument.replace(CONFIG_PORT_ARGUMENT, ""));
					}
					//DAEMON_MODE = argument.contains(DEMON_ARGUMENT);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.exit(-1);
		}
	}



}
