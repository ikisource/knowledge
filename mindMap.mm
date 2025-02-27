<map version="freeplane 1.12.1">
<!--To view this file, download free mind mapping software Freeplane from https://www.freeplane.org -->
<node TEXT="informatique" FOLDED="false" ID="ID_696401721" CREATED="1610381621824" MODIFIED="1740492647007" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle" zoom="1.69">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" show_tags="UNDER_NODES" associatedTemplateLocation="template:/standard-1.6.mm" fit_to_viewport="false" show_icons="BESIDE_NODES"/>
    <tags category_separator="::"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="bottom_or_right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ID="ID_271890427" ICON_SIZE="12 pt" COLOR="#000000" STYLE="fork">
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#000000" WIDTH="2" TRANSPARENCY="200" DASH="" FONT_SIZE="9" FONT_FAMILY="SansSerif" DESTINATION="ID_271890427" STARTARROW="NONE" ENDARROW="DEFAULT"/>
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
<richcontent TYPE="DETAILS" CONTENT-TYPE="plain/auto"/>
<richcontent TYPE="NOTE" CONTENT-TYPE="plain/auto"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.tags">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.selection" BACKGROUND_COLOR="#afd3f7" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#afd3f7"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="bottom_or_right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important" ID="ID_67550811">
<icon BUILTIN="yes"/>
<arrowlink COLOR="#003399" TRANSPARENCY="255" DESTINATION="ID_67550811"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="bottom_or_right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10 pt" SHAPE_VERTICAL_MARGIN="10 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="13" RULE="ON_BRANCH_CREATION"/>
<node TEXT="Architecture" POSITION="bottom_or_right" ID="ID_1858580679" CREATED="1698393498570" MODIFIED="1698480118409">
<edge COLOR="#ff0000"/>
<node TEXT="REST" ID="ID_1890890408" CREATED="1698393509866" MODIFIED="1698393513300"/>
<node TEXT="Hexagonal architecture" ID="ID_291822069" CREATED="1698393513904" MODIFIED="1740492616232"/>
<node TEXT="Clean architecture" ID="ID_1993754521" CREATED="1733753515604" MODIFIED="1733753523742"/>
<node TEXT="Architecture Document Record (ADR)" ID="ID_1359929832" CREATED="1733754515213" MODIFIED="1740497905971"/>
</node>
<node TEXT="Conception" POSITION="bottom_or_right" ID="ID_1405134417" CREATED="1698480090368" MODIFIED="1698480111892">
<edge COLOR="#00ff00"/>
<node TEXT="UML" ID="ID_1518644435" CREATED="1698480122725" MODIFIED="1698480126022"/>
<node TEXT="Design patterns" ID="ID_1590550901" CREATED="1698480129354" MODIFIED="1698480137570"/>
<node TEXT="SOLID" ID="ID_1698862338" CREATED="1698480138229" MODIFIED="1698480140693"/>
<node TEXT="KISS" ID="ID_1626244328" CREATED="1698480142029" MODIFIED="1698480145735"/>
<node TEXT="Law of Demeter" ID="ID_4794118" CREATED="1698480146879" MODIFIED="1698480155098"/>
<node TEXT="Domain-Driven Desin (DDD)" ID="ID_1884157133" CREATED="1733753728978" MODIFIED="1740492692222"/>
</node>
<node TEXT="Development" POSITION="bottom_or_right" ID="ID_1749300458" CREATED="1698480170637" MODIFIED="1698480177076">
<edge COLOR="#ff00ff"/>
<node TEXT="Java" ID="ID_1335285021" CREATED="1698480177770" MODIFIED="1698480180592">
<node TEXT="21" OBJECT="java.lang.Long|21" ID="ID_1565254222" CREATED="1698480181352" MODIFIED="1698480183558">
<node TEXT="Virtual Thread" ID="ID_17772264" CREATED="1698480183737" MODIFIED="1698480194433"/>
</node>
</node>
<node TEXT="Test-Driven Design (TDD)" POSITION="bottom_or_right" ID="ID_1226421413" CREATED="1733753733193" MODIFIED="1740492727712"/>
<node TEXT="Behavior-Driven Desin (BDD)" POSITION="bottom_or_right" ID="ID_25501642" CREATED="1733753737693" MODIFIED="1740492746278"/>
<node TEXT="IDE" POSITION="bottom_or_right" ID="ID_1378229384" CREATED="1733754460732" MODIFIED="1733754463911">
<node TEXT="IntelliJ" ID="ID_1740048299" CREATED="1733754464233" MODIFIED="1733754469661"/>
<node TEXT="Eclipse" ID="ID_809673346" CREATED="1733754470243" MODIFIED="1733754473848"/>
<node TEXT="Visual studio code" ID="ID_2993954" CREATED="1733754474468" MODIFIED="1733754596384"/>
</node>
</node>
<node TEXT="Build" POSITION="bottom_or_right" ID="ID_1478310538" CREATED="1733754428831" MODIFIED="1733754433947">
<edge COLOR="#00007c"/>
<node TEXT="Gradle" ID="ID_1642017302" CREATED="1733754434768" MODIFIED="1733754445487"/>
<node TEXT="Maven" ID="ID_1460625687" CREATED="1733754445983" MODIFIED="1733754449519"/>
<node TEXT="Docker" ID="ID_844482981" CREATED="1733754626083" MODIFIED="1733754629892"/>
</node>
<node TEXT="CI / CD" POSITION="bottom_or_right" ID="ID_12709131" CREATED="1733754356775" MODIFIED="1733754369500">
<edge COLOR="#7c0000"/>
<node TEXT="Gitlab" ID="ID_500777465" CREATED="1733754377910" MODIFIED="1733754382422"/>
<node TEXT="Github" ID="ID_342418469" CREATED="1733754383408" MODIFIED="1733754389601"/>
<node TEXT="Jenkins" ID="ID_1731465215" CREATED="1733754394275" MODIFIED="1733754397502"/>
</node>
<node TEXT="Documentation" POSITION="bottom_or_right" ID="ID_292613029" CREATED="1733753869054" MODIFIED="1733753874621">
<edge COLOR="#00ffff"/>
<node TEXT="Living documentation" ID="ID_1748682357" CREATED="1733753875984" MODIFIED="1733753889957"/>
</node>
<node TEXT="Frameworks" POSITION="top_or_left" ID="ID_755942901" CREATED="1698396482068" MODIFIED="1733753547938">
<edge COLOR="#0000ff"/>
<node TEXT="Spring" ID="ID_505159974" CREATED="1698396497421" MODIFIED="1698396501000">
<node TEXT="Spring boot" ID="ID_211611132" CREATED="1698396503225" MODIFIED="1698396512614"/>
</node>
<node TEXT="ORM" ID="ID_582668034" CREATED="1733753550595" MODIFIED="1733753555201">
<node TEXT="Hibernate" ID="ID_573979402" CREATED="1733753564995" MODIFIED="1733753570764"/>
</node>
</node>
<node TEXT="scalability" POSITION="top_or_left" ID="ID_174653295" CREATED="1740492900041" MODIFIED="1740492909386">
<edge COLOR="#007c00"/>
</node>
<node TEXT="System" POSITION="top_or_left" ID="ID_1005674158" CREATED="1740497693657" MODIFIED="1740497698062">
<edge COLOR="#007c7c"/>
<node TEXT="CAP" POSITION="top_or_left" ID="ID_605713243" CREATED="1740492983125" MODIFIED="1740497703167">
<node TEXT="Consistency" ID="ID_1228926059" CREATED="1740492986391" MODIFIED="1740492992811"/>
<node TEXT="Avaibility" ID="ID_381263308" CREATED="1740492993454" MODIFIED="1740492999782"/>
<node TEXT="Partition" ID="ID_1282811969" CREATED="1740493000492" MODIFIED="1740493005283"/>
</node>
</node>
<node TEXT="Protocol" POSITION="top_or_left" ID="ID_921224599" CREATED="1740497963929" MODIFIED="1740497969751">
<edge COLOR="#7c7c00"/>
<node TEXT="HTTP" ID="ID_1841288465" CREATED="1740497970816" MODIFIED="1740497974040">
<node TEXT="CORS" ID="ID_1706671433" CREATED="1740497974842" MODIFIED="1740497988241"/>
</node>
</node>
<node TEXT="Message broker" POSITION="top_or_left" ID="ID_83783858" CREATED="1740498103227" MODIFIED="1740498110425">
<edge COLOR="#ff0000"/>
<node TEXT="RabbitMQ" ID="ID_472557603" CREATED="1740498111812" MODIFIED="1740498116426"/>
</node>
<node TEXT="communication" POSITION="top_or_left" ID="ID_1949076205" CREATED="1740499380891" MODIFIED="1740499386662">
<edge COLOR="#0000ff"/>
<node TEXT="Synchrone" ID="ID_783929730" CREATED="1740499387903" MODIFIED="1740499396200"/>
<node TEXT="Asynchrone" ID="ID_564025272" CREATED="1740499396838" MODIFIED="1740499401536"/>
</node>
</node>
</map>
