package ar.edu.objetos.uno.patrones_3;

import java.util.*;

public class MediaPlayer {
	
	private ArrayList<Media> media;
	
	public MediaPlayer() {
		this.media = new ArrayList<Media>();
	}
	
	public void addMedia(Media media) {
		this.media.add(media);
	}

	public void play() {
		this.media.stream().forEach(media -> media.play());
	}
	
}
