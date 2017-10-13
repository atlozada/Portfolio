//TODO fix listener functions' draw order
//TODO adjust zoom and boundaries

//Create fully qualified URL to raster source
var tilePrefix = "https://api.mapbox.com/v4/";
var tileSuffix = "/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoid2lsZHRoaW5nYXBwIiwiYSI6ImNpeHV6NzVjYzAwNXAyd21uamtrbDJsdDcifQ.zMhOhN12KG1_myT636OGRw";
var wildnessTile = tilePrefix + "wildthingapp.51ir2v01" + tileSuffix;
var climateTile = tilePrefix + "wildthingapp.c4pts1xe" + tileSuffix;

//URL for wilderness polygons
var polyArray = ["mapbox://wildthingapp.9mjv90rl",
                "mapbox://wildthingapp.76vs6vrv",
                "mapbox://wildthingapp.135b06ep",
                "mapbox://wildthingapp.50k5z3k7",
                "mapbox://wildthingapp.264oxz6a",
                "mapbox://wildthingapp.ch8k83cc",
                "mapbox://wildthingapp.0huecnxi",
                "mapbox://wildthingapp.405elp8u",
                "mapbox://wildthingapp.clrbhsdb",
                "mapbox://wildthingapp.6r6fiszd",
                "mapbox://wildthingapp.c7tbvuyp",
                "mapbox://wildthingapp.1ha0rccq"];

//Source name for wilderness polygons
var polySource = ["wild_poly1-1ad27v",
                "wild_poly2-32mjdo",
                "wild_poly3-7tbj9q",
                "wild_poly4-9q1bzi",
                "wild_poly5-ar2fsi",
                "wild_poly6-94olw6",
                "wild_poly7-af7uqm",
                "wild_poly8-6wmamc",
                "wild_poly9-09kznz",
                "wild_poly10-5p9uaw",
                "wild_poly11-4z9m3p",
                "wild_poly12-by74zl"];

//Source name, url, line layer, fill layer, source layer, color
var lineLayerArray = [['wilderness-areas', 'mapbox://wildthingapp.boxfagqi', 'wilderness-line', 'wilderness-layer', 'Wilderness_Areas-8ithth', '#37C132'],
                    ['blm', 'mapbox://wildthingapp.c94b2og2', 'blm-line', 'blm-layer', 'BLM-diusq9', '#FFFF00'],
                    ['nps','mapbox://wildthingapp.4xg4igot','nps-line','nps-layer','NPS-4hnup3','#A80084'],
                    ['fs','mapbox://wildthingapp.9f25kx1o','fs-line','fs-layer','FS-1ik4t1','#388C00'],
                    ['fws','mapbox://wildthingapp.8ory1icj', 'fws-line','fws-layer','FWS-da9y5v','#FFCC00']];

//Source name, array of tile urls, layer name
var rasterLayerArray = [['wildness-data', [wildnessTile], 'wildness'],
                        ['climate-data', [climateTile], 'climate']];

var amphibColor = [[4, '#1C92C9'],
                  [5, '#2D95C6'],
                  [6, '#3E9DBD'],
                  [7, '#5FA5B5'],
                  [8, '#75ADAD'],
                  [9, '#86B5A4'],
                  [10, '#95BD9B'],
                  [11, '#A3C691'],
                  [12, '#AFCD87'],
                  [13, '#BBD57D'],
                  [14, '#C6DD72'],
                  [15, '#D0E466'],
                  [16, '#DBEC59'],
                  [17, '#E5F447'],
                  [18, '#EFFB32'],
                  [19, '#F3FC2A'],
                  [20, '#F4F92A'],
                  [21, '#F5F629'],
                  [22, '#F6F328'],
                  [23, '#F7EF26'],
                  [24, '#F8EC24'],
                  [25, '#F8E822'],
                  [26, '#F9E51E'],
                  [27, '#FAE11C'],
                  [28, '#FADC1D'],
                  [29, '#FCD022'],
                  [30, '#FCC325'],
                  [31, '#FDB724'],
                  [32, '#FFAA1F'],
                  [33, '#FE9D18'],
                  [34, '#FE9D18'],
                  [35, '#FE801C'],
                  [36, '#FF7220'],
                  [37, '#FE6022'],
                  [38, '#FD4E1F'],
                  [39, '#FE3B17'],
                  [40, '#FE2410'],
                  [41, '#FD100A'],
                  [42, '#FD100A'],
                  [43, '#FD100A'],
                  [44, '#FD100A'],
                  [45, '#FD100A'],
                  [46, '#FD100A']];

var amphibPaint = {
                    'fill-color': {
                      property: 'Join_Count',
                      stops: amphibColor
                    }
                };

var fishColor = [[22, '#1C92C9'],
                [27, '#3298C3'],
                [32, '#5CA3B7'],
                [44, '#91BB9D'],
                [51, '#A5C790'],
                [58, '#B4D183'],
                [64, '#C2DA76'],
                [70, '#D0E467'],
                [76, '#DDEE56'],
                [82, '#E9F83E'],
                [89, '#F3FD2A'],
                [95, '#F4FA2A'],
                [101, '#F5F528'],
                [107, '#F6F128'],
                [113, '#F7ED24'],
                [119, '#F8E923'],
                [124, '#F9E51E'],
                [130, '#FAE01B'],
                [136, '#FCCF22'],
                [142, '#FDB624'],
                [148, '#FE9B18'],
                [154, '#FD7F1D'],
                [160, '#FE5D23'],
                [169, '#FD4018'],
                [176, '#FE1F0E'],
                [238, '#FD100A']];

var fishPaint = {
                    'fill-color': {
                      property: 'Join_Count',
                      stops: fishColor
                    }
                };

var priorityIndexColor = [[0, '#CCCCCC'],
                        [1, '#B7B7B7'],
                        [3, '#AFD5EA'],
                        [6, '#7A9C84'],
                        [9, '#A4B96A'],
                        [12, '#C1D689'],
                        [15, '#E0DA34'],
                        [18, '#FDE35A'],
                        [21, '#FCB245'],
                        [24, '#FC8531'],
                        [27, '#EA5628'],
                        [50000, '#E81015']];

var priorityIndexPaint = {
      'fill-color': {
          property: 'Priority_i',
          stops: priorityIndexColor
      }
  };

var birdColor = [[3,"#1684A8"],
                [4,"#1684A8"],
                [5,"#1684A8"],
                [6,"#1684A8"],
                [7,"#1684A8"],
                [8,"#1684A8"],
                [9,"#1684A8"],
                [10,"#1684A8"],
                [11,"#1684A8"],
                [12,"#1684A8"],
                [13,"#1684A8"],
                [17,"#1684A8"],
                [18,"#1885AA"],
                [19,"#1E88AE"],
                [21,"#1C8CB2"],
                [22,"#188FB6"],
                [23,"#1A92BB"],
                [25,"#2396BF"],
                [26,"#2099C3"],
                [29,"#1D9CC7"],
                [38,"#1CA0CC"],
                [39,"#17A3D0"],
                [40,"#12A7D4"],
                [45,"#0EAAD9"],
                [122,"#13AEDD"],
                [123,"#1BB1E2"],
                [124,"#10B5E6"],
                [125,"#21B6E4"],
                [126,"#2BB7E2"],
                [127,"#34B8DF"],
                [128,"#3CB9DD"],
                [129,"#40BADB"],
                [130,"#46BBD9"],
                [131,"#4CBCD7"],
                [132,"#56BDD4"],
                [133,"#5BBED2"],
                [134,"#60BFD0"],
                [135,"#64C0CE"],
                [136,"#69C1CC"],
                [137,"#6DC2C9"],
                [138,"#72C3C7"],
                [139,"#76C5C5"],
                [140,"#7AC6C3"],
                [141,"#7DC7C0"],
                [142,"#81C8BE"],
                [143,"#84C9BC"],
                [144,"#88CABA"],
                [145,"#8BCBB7"],
                [146,"#8ECCB5"],
                [147,"#91CDB3"],
                [148,"#94CFB0"],
                [149,"#97D0AE"],
                [150,"#9AD1AC"],
                [151,"#9DD2A9"],
                [152,"#A0D3A7"],
                [153,"#A2D4A5"],
                [154,"#A5D5A2"],
                [155,"#A7D6A0"],
                [156,"#AAD79D"],
                [157,"#ADDE9A"],
                [158,"#B0DF98"],
                [159,"#B2E095"],
                [160,"#B4E193"],
                [161,"#B7E290"],
                [162,"#B9E38E"],
                [163,"#BCE48B"],
                [164,"#BEE588"],
                [165,"#C0E686"],
                [166,"#C2E783"],
                [167,"#C4E880"],
                [168,"#C7E97E"],
                [169,"#C9EA7B"],
                [170,"#CBEB78"],
                [171,"#CDEC75"],
                [172,"#CFED72"],
                [173,"#D1EE6F"],
                [174,"#D3EF6C"],
                [175,"#D5F069"],
                [176,"#D7F165"],
                [177,"#D9F262"],
                [178,"#DBF35F"],
                [179,"#DDF45C"],
                [180,"#DFF559"],
                [181,"#E1F655"],
                [182,"#E3F750"],
                [183,"#E5F84C"],
                [184,"#E7F947"],
                [185,"#E9FA42"],
                [186,"#EBFB3E"],
                [187,"#EDFB39"],
                [188,"#EFFC33"],
                [189,"#F1FD2E"],
                [190,"#F2FE2A"],
                [191,"#F3FC2A"],
                [192,"#F4FB2A"],
                [193,"#F4F92A"],
                [194,"#F5F72A"],
                [195,"#F5F528"],
                [196,"#F6F328"],
                [197,"#F6F128"],
                [198,"#F7EF27"],
                [199,"#F7EE25"],
                [200,"#F8EC24"],
                [201,"#F8EA23"],
                [202,"#F8E822"],
                [203,"#F9E61F"],
                [204,"#F9E41D"],
                [205,"#FAE21C"],
                [206,"#FAE01B"],
                [207,"#FADC1D"],
                [208,"#FCD41F"],
                [209,"#FDCB23"],
                [210,"#FDC325"],
                [211,"#FDBA25"],
                [212,"#FDB123"],
                [213,"#FFA81F"],
                [214,"#FE9F19"],
                [215,"#FE9616"],
                [216,"#FF8D15"],
                [217,"#FE821A"],
                [218,"#FE781E"],
                [219,"#FF6E21"],
                [220,"#FF6122"],
                [221,"#FD5523"],
                [222,"#FD4F20"],
                [223,"#FD491C"],
                [224,"#FD441A"],
                [225,"#FE3E18"],
                [226,"#FE3916"],
                [227,"#FE3514"],
                [228,"#FE2C12"],
                [229,"#FE230F"],
                [230,"#FE1C0D"],
                [231,"#FD140B"],
                [232,"#FD100A"],
                [233,"#FD100A"],
                [234,"#FD100A"],
                [235,"#FD100A"],
                [236,"#FD100A"],
                [237,"#FD100A"],
                [238,"#FD100A"],
                [239,"#FD100A"],
                [240,"#FD100A"],
                [241,"#FD100A"],
                [242,"#FD100A"],
                [243,"#FD100A"],
                [244,"#FD100A"],
                [245,"#FD100A"],
                [246,"#FD100A"],
                [247,"#FD100A"],
                [248,"#FD100A"],
                [249,"#FD100A"]];

var birdPaint = {
                    'fill-color': {
                      property: 'gridcode',
                      stops: birdColor
                    }
                };

var wildPolyColor = [[6,"#63126E"],
                    [7,"#812163"],
                    [8,"#A2215C"],
                    [9,"#C91B3D"],
                    [10,"#EA3750"],
                    [11,"#F84F68"],
                    [12,"#FF6380"],
                    [13,"#AD7D20"],
                    [14,"#BC8E4B"],
                    [15,"#C8A059"],
                    [16,"#D4B372"],
                    [17,"#DFBD8D"],
                    [18,"#E3D19A"],
                    [19,"#BCF27F"],
                    [20,"#A8E26F"],
                    [21,"#99CA59"],
                    [22,"#84AC44"],
                    [23,"#6F982E"],
                    [24,"#5A8318"],
                    [25,"#16467D"],
                    [26,"#3A69AB"],
                    [27,"#5487C7"],
                    [28,"#73A1D1"],
                    [29,"#96B9DE"],
                    [30,"#C7D8ED"]];

var wildPolyPaint = {
    'fill-color': {
        property: 'gridcode',
        stops: wildPolyColor
    }
}

//Source name, url, layer name, source-layer name, JSON object containing layer paint parameters
var polyLayerArray = [['amphibians', "mapbox://wildthingapp.bg90sqk5", "amphibian-layer", "Amphibians_total_richness-9olu92", amphibPaint],
                        ['fish', "mapbox://wildthingapp.6wf095b3",  "fish-layer", "Fish_total_richness-4n17wh", fishPaint],
                        ['pi_data', "mapbox://wildthingapp.8m2gm1gt", "priority_index", 'Priority_Index_Summary-dei689', priorityIndexPaint],
                        ['birds', "mapbox://wildthingapp.9zbuyuqx", "bird-layer", "Birds_Total_Richness_Poly-9w0eo0", birdPaint]];

//Adds multiple data sources and layers to the map
function loadMap() {

    //Change the cursor
    map.getCanvas().style.cursor = 'pointer';

    //NOTE Draw order is important, largest layers (covers most area) are added first, followed by small layers


    //Add raster data and layers
    rasterLayerArray.forEach(function(layer) {
        map.addSource(layer[0], {
            "type": "raster",
            "tiles": layer[1]
        });

        map.addLayer({
            "id": layer[2],
            "type": "raster",
            "source": layer[0],
            'layout': {
                'visibility': 'none'
            }
        });
    });

    //Add polygon data and layers
    polyLayerArray.forEach(function(layer) {
        map.addSource(layer[0], {
            "type": "vector",
            "url": layer[1]
        });

        map.addLayer({
            "id": layer[2],
            "type": "fill",
            "source": layer[0],
            "source-layer": layer[3],
            "paint": layer[4],
            'layout': {
                'visibility': 'none'
            }
        });
    });

    map.setLayoutProperty('wildness', 'visibility', 'visible');

    //Add wildness vector data source and layer
    for (i = 0; i < polyArray.length; i++) {
        map.addSource("vector-data"+i, {
            "type": "vector",
            "url": polyArray[i]
        });

        //fill-color => stops sets a gradient
        map.addLayer({
            "id": "vector" + i,
            "type": "fill",
            "source": "vector-data" + i,
            "source-layer": polySource[i],
            "minzoom": 6,
            "maxzoom": 22,
            "paint": wildPolyPaint
        });
    }

    //Add polygon/line data and layers
    for (i=0; i<lineLayerArray.length; i++) {
        map.addSource(lineLayerArray[i][0], {
            "type": "vector",
            "url": lineLayerArray[i][1]
        })

        map.addLayer({
            "id": lineLayerArray[i][2],
            "type": "line",
            "source": lineLayerArray[i][0],
            "source-layer": lineLayerArray[i][4],
            "paint": {
                'line-color': lineLayerArray[i][5],
                'line-width': 2
            }
        });

        map.addLayer({
            "id": lineLayerArray[i][3],
            "type": "fill",
            "source": lineLayerArray[i][0],
            "source-layer": lineLayerArray[i][4],
            "paint": {
                'fill-color': lineLayerArray[i][5],
                'fill-opacity': .3
            }
        });

        map.setLayoutProperty(lineLayerArray[i][2], 'visibility','none');
        map.setLayoutProperty(lineLayerArray[i][3], 'visibility','none');
        map.moveLayer(lineLayerArray[i][2]);
        map.moveLayer(lineLayerArray[i][3]);
    }

    //Add States data set
    map.addSource('states', {
        "type": "vector",
        "url": "mapbox://wildthingapp.2v1una7q"
    });

    //Add States outline layer, omitting non-state territories
    map.addLayer({
        "id": "states-layer",
        "type": "line",
        "source": "states",
        "source-layer": "US_State_Borders-4axtaj",
        "filter": ["!in","NAME","Puerto Rico", "Guam","American Samoa", "Commonwealth of the Northern Mariana Islands","United States Virgin Islands"]
    });

    map.setLayerZoomRange('wildness', 0, 7);
}

//Sets event listeners for filter-group
function setEventListeners() {
    var checkboxSmallLayers = [[$("[name='FWS']"), 'fws'],
                        [$("[name='NPS']"), 'nps'],
                        [$("[name='FS']"), 'fs'],
                        [$("[name='BLM']"), 'blm'],
                        [$("[name='wilderness-checkbox']"), 'wilderness']];

    var checkboxLargeLayers = [[$("[name='climate-checkbox']"), 'climate'],
                      [$("[name='wildness-checkbox']"), 'wildness'],
                      [$("[name='amphib-checkbox'"), 'amphibian-layer'],
                      [$("[name='fish-checkbox']"), 'fish-layer'],
                      [$("[name='priority-checkbox']"), 'priority_index'],
                      [$("[name='bird-checkbox']"),'bird-layer']];

    var sliderArray = [[$('#wildnessSlider'), 'wildness', 'raster-opacity', 'wildnessSlider'],
                       [$('#amphibSlider'), 'amphibian-layer', 'fill-opacity', 'amphibSlider'],
                       [$('#fishSlider'), 'fish-layer', 'fill-opacity', 'fishSlider'],
                       [$('#climateSlider'), 'climate', 'raster-opacity', 'climateSlider'],
                       [$('#prioritySlider'), 'priority_index', 'fill-opacity', 'prioritySlider'],
                       [$('#birdSlider'), 'bird-layer', 'fill-opacity', 'birdSlider']];

    //This variable ensures that the small layers will always be above the large layers in draw order
    var smallLayerPartition = lineLayerArray[lineLayerArray.length-1][3];

    checkboxSmallLayers.forEach(function(layer) {
        layer[0].on('switchChange.bootstrapSwitch', function() {
            if (layer[0].bootstrapSwitch('state')) {
                map.setLayoutProperty(layer[1]+'-layer', 'visibility', 'visible');
                map.setLayoutProperty(layer[1]+'-line', 'visibility','visible');
                map.moveLayer(layer[1]+'-layer');
                map.moveLayer(layer[1]+'-line');

            } else {
                map.setLayoutProperty(layer[1]+'-layer', 'visibility', 'none');
                map.setLayoutProperty(layer[1]+'-line', 'visibility','none');

            }
        });
    });

    checkboxLargeLayers.forEach(function(layer) {
        if (layer[1] == 'wildness') {
            layer[0].on('switchChange.bootstrapSwitch', function() {
                if ( layer[0].bootstrapSwitch('state')) {
                    map.setLayoutProperty(layer[1], 'visibility', 'visible');
                    for (i=0;i<polyArray.length;i++) {
                        map.setLayoutProperty('vector'+i, 'visibility', 'visible');
                        map.moveLayer('vector'+i);
                    }
                    map.moveLayer(layer[1], smallLayerPartition);

                    lineLayerArray.forEach(function(layer) {
                        if (map.getLayoutProperty(layer[2], 'visibility') == 'visible') {
                            map.moveLayer(layer[2],smallLayerPartition);
                            map.moveLayer(layer[3],smallLayerPartition);
                        }
                    });
                } else {
                    map.setLayoutProperty(layer[1], 'visibility', 'none');
                    for (i=0;i<polyArray.length;i++) {
                        map.setLayoutProperty('vector'+i, 'visibility', 'none');
                    }
                }
            });
        } else {
            layer[0].on('switchChange.bootstrapSwitch', function() {
                if (layer[0].bootstrapSwitch('state')) {

                    map.setLayoutProperty(layer[1], 'visibility', 'visible');

                    map.moveLayer(layer[1], smallLayerPartition);


                    lineLayerArray.forEach(function(layer) {
                        if (map.getLayoutProperty(layer[2], 'visibility') == 'visible') {
                            map.moveLayer(layer[2],smallLayerPartition);
                            map.moveLayer(layer[3],smallLayerPartition);
                        }
                    });
                } else {
                    map.setLayoutProperty(layer[1], 'visibility', 'none');
                }

            });
        }
    });

    //Add wilderness info popup
    map.on('click', 'wilderness-layer', function(e) {
        new mapboxgl.Popup()
        .setLngLat(e.lngLat)
        .setHTML('<h5> <a href=' + e.features[0].properties.URL + '>'  + e.features[0].properties.NAME + '</a> </h5>' + '<p class=popup>' + e.features[0].properties.Descriptio + '</p>')
        .addTo(map);
    });
}

function loadSelection(map) {
    var selection = $('.selection');
    var layerArray = ['Wildness Index', 'Wilderness Areas', 'Fish Biodiversity', 'Amphibian Biodiversity', 'Biodiversity Priority', 'Rate of Climate Change', 'Bird Biodiversity', 'Fish and Wildlife Service', 'Bureau of Land Management', 'United States Forest Service', 'National Park Service'];
    var nameArray = ['wildness-checkbox','wilderness-checkbox', 'fish-checkbox', 'amphib-checkbox',  'priority-checkbox', 'climate-checkbox', 'bird-checkbox', 'FWS', 'BLM', 'FS', 'NPS'];
    var checkboxArray = ["[name='wildness-checkbox']", "[name='wilderness-checkbox']", "[name='fish-checkbox']", "[name='amphib-checkbox']","[name='priority-checkbox']", "[name='climate-checkbox']", "[name='bird-checkbox']", "[name='FWS']", "[name='BLM']", "[name='FS']", "[name='NPS']"];

    for (i=0;i<layerArray.length;i++) {
        var input = document.createElement('input');
        var label = document.createElement('label');

        input.type = 'checkbox';
        input.name = nameArray[i];

        //Default layer is wildness
        if (nameArray[i] == 'wildness-checkbox') {
            input.checked = true;
        } else {
            input.checked = false;
        }

        label.setAttribute('for', nameArray[i]);
        label.textContent = layerArray[i];

        selection.append(input);
        selection.append(label);

        $(checkboxArray[i]).bootstrapSwitch();
    }
}

//Map initialization
mapboxgl.accessToken = 'pk.eyJ1Ijoid2lsZHRoaW5nYXBwIiwiYSI6ImNpeHV6NzVjYzAwNXAyd21uamtrbDJsdDcifQ.zMhOhN12KG1_myT636OGRw';
var map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/outdoors-v10',
    center: [-107, 39],
    zoom: 4
});

//Map loading
map.on('load', function(e) {
    loadMap();
    loadSelection();
    setEventListeners();
});

// Add zoom and rotation controls to the map.
map.addControl(new mapboxgl.FullscreenControl(), 'top-right');
map.addControl(new mapboxgl.NavigationControl(), 'top-right');
