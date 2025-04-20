package ar.edu.objetos.uno.patrones_3;

public class VideoStreamAdapter {
	
	private VideoStream videoStream;
	
	public VideoStreamAdapter(VideoStream videoStream) {
		this.videoStream = videoStream;
	}
	
	public void play() {
		this.videoStream.reproduce();
	}

}
