// Define an array to hold the quests
let quests = [];

// Define a quest object constructor function
function Quest(title, description, reward) {
  this.title = title;
  this.description = description;
  this.reward = reward;
  this.completed = false;
}

// Define a function to add a quest to the quests array
function addQuest(quest) {
  quests.push(quest);
}

// Define a function to complete a specific quest
function completeQuest(title) {
  let quest;
  for (let i = 0; i < quests.length; i++) {
    if (quests[i].title === title) {
      quest = quests[i];
      break;
    }
  }
  if (quest && !quest.completed) {
    quest.completed = true;
    console.log(`Congratulations! You have completed the "${quest.title}" quest and earned a reward of ${quest.reward} gold.`);
  } else if (quest && quest.completed) {
    console.log("This quest has already been completed.");
  } else {
    console.log(`No quest with the title "${title}" was found.`);
  }
}

// Test the quest functions
let quest1 = new Quest("The Lost Sword", "A powerful sword has been lost in the forests. Retrieve it and bring it back to the king to receive your reward.", 1000);
let quest2 = new Quest("The Missing Princess", "The princess has been kidnapped by a group of trolls. Rescue her and bring her safely home to receive your reward.", 2000);
addQuest(quest1);
addQuest(quest2);

completeQuest("The Lost Sword");  // Output: "Congratulations! You have completed the "The Lost Sword" quest and earned a reward of 1000 gold."
completeQuest("The Missing Princess");  // Output: "Congratulations! You have completed the "The Missing Princess" quest and earned a reward of 2000 gold."
completeQuest("The Lost Sword");  // Output: "This quest has already been completed."
completeQuest("The Missing Trolls");  // Output: "No quest with the title "The Missing Trolls" was found."