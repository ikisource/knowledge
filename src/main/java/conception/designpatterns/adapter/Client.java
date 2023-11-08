package conception.designpatterns.adapter;

public class Client {

    private static Rectangle rectangle;

    public static void main(String[] args) {

        Square square = new Square(5);
        rectangle = new Adapter(square);

        System.out.println("Rectangle width = " + rectangle.getWidth());
        System.out.println("Rectangle height = " + rectangle.getHeight());
    }

}
