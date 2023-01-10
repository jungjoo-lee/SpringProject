import java.io.File;
import java.io.IOException;

import net.coobird.thumbnailator.Thumbnails;

public class asdfsdf {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub

		String thumbnail = "thumbnail_" + String.valueOf(System.nanoTime());

		File file = new File("C://book//image//리액트를 다루는 기술.jpg");

		File thumbFile = new File(String.valueOf("C://book//thumbnail//리액트를 다루는 기술" ));
		Thumbnails.of(file).size(220, 270).outputFormat("png").toFile(thumbFile);
	}
}