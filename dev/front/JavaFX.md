# JavaFX

## Installer JavaFX sous Ubuntu

## Tutoriels vidéos

### Les teachers du net
[Apprendre JavaFX](https://www.youtube.com/watch?v=02SFViTyX4A&list=PLlxQJeQRaKDSlg_sOFKqBHvFsox2ZVWbs)

## CSS

```
// root node
.root {
}

// predefined class node for Label
.button {
	-fx-graphic: url("../images/like.png");
}

// pseudo class
.button:hover {
	-fx-graphic: url("../images/like-hover.png");
}

// identified node
#myLabel {
}

```

## Contrôleur

Dans main.fxml

```
<fx:include fx:id="bottom" source="/fxml/bottom.fxml"
```
Dans MainController


```
@FXML
private BottomController bottomController
```


