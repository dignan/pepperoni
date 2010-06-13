using Gtk;

public class Main {
    public static int main (string[] args) {

        Gtk.init(ref args);

        DocumentWindow initialWindow = new DocumentWindow();

        Gtk.main();

        return 0;
    }
}

