package conception.designpatterns.adapter;

public class Adapter implements Rectangle {

    private Square square;

    public Adapter(Square square) {
        this.square = square;
    }

    @Override
    public Integer getWidth() {
        return square.getSide();
    }

    @Override
    public Integer getHeight() {
        return square.getSide();
    }
}
