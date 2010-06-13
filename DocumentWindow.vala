using Gtk;

public class DocumentWindow { 

    Window docWindow;
    MenuBar menubar;
    Menu fileMenu;
    MenuItem fileMenuItem;
    MenuItem fileMenuOpen;
    MenuItem fileMenuSave;
    MenuItem fileMenuExit;

    VBox majorBox;
    
    DocumentArea docArea;
    
    public DocumentWindow() {
        docWindow = new Window(WindowType.TOPLEVEL);
        docWindow.set_position(WindowPosition.CENTER);
        docWindow.set_title("Pepperoni");
        docWindow.destroy.connect(Gtk.main_quit);

        /* Menu intialization */        
        menubar = new MenuBar();

        fileMenuItem = new MenuItem.with_label("File");
        fileMenu = new Menu();        
        fileMenuItem.set_submenu(fileMenu);

        menubar.append(fileMenuItem);

        fileMenuOpen = new MenuItem.with_label("Open");
        fileMenuSave = new MenuItem.with_label("Save");
        fileMenuExit = new MenuItem.with_label("Exit");

        fileMenu.append(fileMenuOpen);
        fileMenu.append(fileMenuSave);
        fileMenu.append(fileMenuExit);

        /* Initialize document area */
        docArea = new DocumentArea();

        majorBox = new VBox(false, 0);
        majorBox.pack_start(menubar, false, false, 0);
        majorBox.pack_start(docArea, false, false, 0);

        docWindow.add(majorBox);

        docWindow.show_all();
    }
}
