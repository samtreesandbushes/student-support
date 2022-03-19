// Adapted from https://p5js.org/reference/#/p5/httpDo

// Examples use USGS Earthquake API:
// https://earthquake.usgs.gov/fdsnws/event/1/#methods

// Turn into eyeball animation by earthquake
// like https://p5js.org/reference/#/p5.Image/delay


// displays an animation of all USGS earthquakes
let earthquakes;
let eqFeatureIndex = 0;

var foo = new p5.Speech(); // speech synthesis object

let bg;

function preload() {
  let url = 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson';
  httpDo(
    url,
    {
      method: 'GET',
      // Other Request options, like special headers for apis
      headers: { authorization: 'Bearer secretKey' }
    },
    function(res) {
      earthquakes = res;
    }
  );
}

function setup() {
  bg = loadImage('assets/rabbit.png');
  createCanvas(600, 500);
  frameRate(5);
}


function draw() {
  
  
  
  // wait until the data is loaded
  if (!earthquakes || !earthquakes.features[eqFeatureIndex]) {
    return;
  }
  clear();
  background(bg);

  //console.log(earthquakes);

  let feature = earthquakes.features[eqFeatureIndex];
  let featureTwo = earthquakes.features[eqFeatureIndex+1];
  let featureThree = earthquakes.features[eqFeatureIndex+2];
  let featureFour = earthquakes.features[eqFeatureIndex+3];

  let mag = feature.properties.mag;
  let magTwo = featureTwo.properties.mag;
  let magThree = featureThree.properties.mag;
  let magFour = featureFour.properties.mag;
  
  let rad = mag / 11 * ((width + height) / 2);
  let radTwo = magTwo / 11 * ((width + height) / 2);  
  let radThree = magThree / 11 * ((width + height) / 2);
  let radFour = magFour / 11 * ((width + height) / 2);

  fill(0);
  ellipse(200 + random(-2, 2), 250 + random(-2, 2), rad/5, rad/5);
  ellipse(150+ random(-2, 2), 200 + random(-2, 2), radTwo/5, radTwo/5);
  
  ellipse(250 + random(-2, 2), 200 + random(-2, 2), radThree/5, radThree/5);
  ellipse(200 + random(-2, 2), 300 + random(-2, 2), radFour/2, radFour/10);
  
  console.log(rad);
  extrRad = round(rad);

  //foo.setVoice("Samantha");
  foo.setPitch(extrRad/20);
  //foo.setVolume(extrRad/20);
  foo.setRate(0.1);
  foo.speak("'"+rad+"'"); // say something

  
  if (eqFeatureIndex+3 >= earthquakes.features.length) {
    eqFeatureIndex = 0;
  } else {
    eqFeatureIndex += 1;
  }
    
  
}