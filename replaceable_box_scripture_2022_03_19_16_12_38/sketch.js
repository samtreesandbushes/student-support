    
let txt = "Identity of Relative and Absolute The mind of the Great Sage of India was intimately conveyed from west to east. Among human beings are wise ones and fools, But in the Way there is no northern or southern Patriarch. The subtle source is clear and bright; the tributary streams flow through the darkness. To be attached to things is illusion; To encounter the absolute is not yet enlightenment. Each and all, the subjective and objective spheres are related, and at the same time, independent. Related, yet working differently, though each keeps its own place. Form makes the character and appearance different; Sounds distinguish comfort and discomfort. The dark makes all words one; the brightness distinguishes good and bad phrases. The four elements return to their nature as a child to its mother. Fire is hot, wind moves, water is wet, earth hard. Eyes see, ears hear, nose smells, tongue tastes the salt and sour. Each is independent of the other; cause and effect must return to the great reality Like leaves that come from the same root. The words high and low are used relatively. Within light there is darkness, but do not try to understand that darkness; Within darkness there is light, but do not look for that light. Light and darkness are a pair, like the foot before and the foot behind, in walking. Each thing has its own intrinsic value and is related to everything else in function and position. Ordinary life fits the absolute as a box and its lid. The absolute works together with the relative like two arrows meeting in mid-air. Reading words you should grasp the great reality. Do not judge by any standards. If you do not see the Way, you do not see it even as you walk on it. When you walk the Way, it is not near, it is not far. If you are deluded, you are mountains and rivers away from it. I respectfully say to those who wish to .";

function setup() {

  createCanvas(600, 800).parent('#cdiv');
  noStroke();
  textSize(17.5);
  loadFont('Chaparral.otf', nextWord);
}

// replace a random word in the text every 2 seconds
function nextWord() {

  let words = RiTa.tokenize(txt); // split into words

  // loop from a random spot
  let r = floor(random(0, words.length));
  for (let i = r; i < words.length + r; i++) {

    let idx = i % words.length;
    let word = words[idx].toLowerCase();
    if (word.length < 3) continue; // len >= 3

    // find related words
    let pos = RiTa.tagger.allTags(word)[0];
    let rhymes = RiTa.rhymes(word, { pos });
    let sounds = RiTa.soundsLike(word, { pos });
    let spells = RiTa.spellsLike(word, { pos });
    let similars = [...rhymes, ...sounds, ...spells];

    // only words with 2 or more similars
    if (similars.length < 2) {
      console.log("No sims for "+word);
      continue;
    }

    // pick a random similar
    let next = "box";

    if (next.includes(word) || word.includes(next)) {
      continue;                     // skip substrings
    }
    if (/[A-Z]/.test(words[idx][0])) {
      next = RiTa.capitalize(next); // keep capitals
    }

    console.log("replace(" + idx + "): " + word + " -> " + next);

    words[idx] = next;             // do replacement
    break;
  }

  // recombine into string and display
  txt = RiTa.untokenize(words); 
  background(0);
  fill(255);
  text(txt, 50, 30, 500, height);

  setTimeout(nextWord, 200);
}

  