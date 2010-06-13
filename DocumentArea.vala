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

        this.add_events(Gdk.EventMask.ALL_EVENTS_MASK);
        this.button_release_event.connect(selected_callback);
    }

    public void set_cursor() {
        drawableArea = this.get_window();
        cursor = new Cursor(CursorType.XTERM);

        if (drawableArea != null) {
            drawableArea.set_cursor(cursor);
        } else {
            stderr.printf("null window\n");
        }   
    }

    private bool selected_callback() {
        stderr.printf("click!\n");
        return true;
    }
}
