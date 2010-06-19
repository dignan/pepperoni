using Gtk;
using Gdk;
using Pango;
using Cairo;

public class DocumentArea : DrawingArea {

    private Gdk.Window drawableArea;
    private Cursor cursor;
    private Cairo.Context cfm;
    public Pango.Layout layout;
    private GC gc;

    private int x = 0;

    int width = 800;
    int height = 600;

    public DocumentArea () {    
        this.set_size_request(width, height);

        this.modify_bg(StateType.NORMAL, get_background_color());

        this.add_events(Gdk.EventMask.BUTTON_PRESS_MASK
                  | Gdk.EventMask.BUTTON_RELEASE_MASK
                  | Gdk.EventMask.POINTER_MOTION_MASK);
                  
        this.button_release_event.connect(selected_callback);
        this.expose_event.connect(exposed_callback);
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

    public void add_pango_layout() {        
        gc = new GC(drawableArea);       
        gc.set_background(get_background_color());

        string hello = "Hello world!";

        layout.set_text(hello, -1);
        stderr.printf("Should be shown...\n");

        cairo_update_layout(cfm, layout);
        draw_layout(drawableArea, gc, 5, 5, layout);
    }

    private bool selected_callback() {
        stderr.printf("click!\n");
        return true;
    }

    private bool exposed_callback() {
        cfm = Gdk.cairo_create(this.window);
        layout = cairo_create_layout(cfm);
        initialize_pango_layout();

        if (x == 1) {
            add_pango_layout();
        }

        x++;
        
        return true;
    }
    
    private Gdk.Color get_background_color () {
        Gdk.Color bg;
        Gdk.Color.parse("#FFF", out bg);
        return bg;
    }

    private void initialize_pango_layout() {
        var fontDesc = new FontDescription();
        fontDesc.set_family("Sans");
        fontDesc.set_size((int) 14 * Pango.SCALE);

        layout.set_font_description(fontDesc);
        layout.context_changed();
    }
}
