using Gtk;

public class Main {
    public static int main (string[] args) {

        Gtk.init(ref args);

        var mainWindow = new Window(WindowType.TOPLEVEL);
        mainWindow.title = "Pepperoni";
        mainWindow.position = WindowPosition.CENTER;
        mainWindow.destroy.connect(Gtk.main_quit);

        mainWindow.show_all();

        Gtk.main();

        return 0;
    }
}

