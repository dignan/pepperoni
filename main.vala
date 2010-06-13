using Gtk;

public class Main {
    public static int main (string[] args) {

        Gtk.init(ref args);

        DocumentWindow initialWindow = new DocumentWindow();
        initialWindow.show();

        Gtk.main();

        return 0;
    }
}

