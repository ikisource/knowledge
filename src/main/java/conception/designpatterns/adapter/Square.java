package conception.designpatterns.adapter;

public class Square {

    private Integer side;

    public Square(Integer side) {
        this.side = side;
    }

    public Integer getSide() {
        return side;
    }

    public Integer calculateArea() {
        return side * side;
    }
}
