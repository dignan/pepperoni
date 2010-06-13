using Gtk;
using Gdk;

public class DocumentArea : DrawingArea {

    Gdk.Window drawableArea;
    Cursor cursor;

    public DocumentArea () {    
        this.set_size_request(800, 600);

        Color bg;
        Gdk.Color.parse("#FFF", out bg);
        this.modify_bg(StateType.NORMAL, bg);
    }

    public void parent_set_callback( ) {
        drawableArea = this.get_window();
        cursor = new Cursor(CursorType.XTERM);

        if (drawableArea != null) {
            drawableArea.set_cursor(cursor);
        } else {
            stderr.printf("null window\n");
        }   
    }
}
