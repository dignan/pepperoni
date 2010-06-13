using Gtk;
using Gdk;

public class DocumentArea : DrawingArea {

    Gdk.Window drawableArea;

    public DocumentArea (){
        this.set_size_request(800, 600);

        Color bg;

        Gdk.Color.parse("#FFF", out bg);
        
        this.modify_bg(StateType.NORMAL, bg);

        drawableArea = this.window;
    }
}
