<map version="freeplane 1.11.5">
<!--To view this file, download free mind mapping software Freeplane from https://www.freeplane.org -->
<node TEXT="REST model" FOLDED="false" ID="ID_696401721" CREATED="1610381621824" MODIFIED="1697897199602" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle" zoom="2.197">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" fit_to_viewport="false" associatedTemplateLocation="template:/standard-1.6.mm"/>

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
<hook NAME="AutomaticEdgeColor" COUNTER="4" RULE="ON_BRANCH_CREATION"/>
<node TEXT="api" POSITION="bottom_or_right" ID="ID_27167021" CREATED="1697899490903" MODIFIED="1697899824928">
<edge COLOR="#ff00ff"/>
<font ITALIC="true"/>
<node TEXT="customers" POSITION="bottom_or_right" ID="ID_247174399" CREATED="1697897207633" MODIFIED="1697899505509">
<node TEXT="getCustomers (GET)" ID="ID_973268880" CREATED="1697897236698" MODIFIED="1697897249667"/>
<node TEXT="createCustomer (POST)" ID="ID_742974218" CREATED="1697897251500" MODIFIED="1697897261052"/>
<node TEXT="{id}" ID="ID_1902571188" CREATED="1697897220868" MODIFIED="1697897228909">
<node TEXT="getCustomer (GET)" POSITION="bottom_or_right" ID="ID_1528217740" CREATED="1697897264510" MODIFIED="1697897272638"/>
<node TEXT="updateCustomer (PUT)" POSITION="bottom_or_right" ID="ID_1113281760" CREATED="1697897294169" MODIFIED="1697897303535"/>
<node TEXT="deleteCustomer (DELETE)" POSITION="bottom_or_right" ID="ID_1474671363" CREATED="1697897277305" MODIFIED="1697897289981"/>
<node TEXT="orders" POSITION="bottom_or_right" ID="ID_1151996040" CREATED="1697897361239" MODIFIED="1697897364985">
<node TEXT="getCustomersOrders (GET)" ID="ID_89691233" CREATED="1697897366880" MODIFIED="1697897380644"/>
</node>
</node>
</node>
<node TEXT="orders" POSITION="bottom_or_right" ID="ID_1913360341" CREATED="1697897389015" MODIFIED="1697899537659">
<node TEXT="getOrders (GET)" ID="ID_508690968" CREATED="1697897395383" MODIFIED="1697897405560"/>
<node TEXT="createOrder (POST)" ID="ID_1676746949" CREATED="1697897407313" MODIFIED="1697897418889"/>
<node TEXT="{id}" ID="ID_1993449307" CREATED="1697897423389" MODIFIED="1697897428940">
<node TEXT="getOrder (GET)" ID="ID_525828442" CREATED="1697897264510" MODIFIED="1697897451334"/>
<node TEXT="updateOrder (PUT)" ID="ID_1243113967" CREATED="1697897294169" MODIFIED="1697897468198"/>
<node TEXT="deleteOrder (DELETE)" ID="ID_1458333590" CREATED="1697897277305" MODIFIED="1697897457661"/>
</node>
</node>
</node>
</node>
</map>
