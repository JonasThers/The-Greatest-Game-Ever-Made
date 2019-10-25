class Highscore {

  Table table; 
  int score = 0;
  String highscoreName = "";  

  Highscore()
  {
    table = loadTable("data.csv", "header");
    table.setColumnType("score", Table.INT);
  }

  void update()
  {  
    if (update) 
    { //So the highscore lists only updates for a brief moment instead of looping and only when the player dies or wins the game
      TableRow newRow = table.addRow();
      newRow.setString("name", highscoreName); //The values of highscoreName and score are loaded into the csv-file under the given values
      newRow.setInt("score", score);
      table.sortReverse("score");

      if (table.getRowCount() > 10)
      {
        table.removeRow(10); //If the amount of entries in the high score list, the tenth bottom one is removed in order to make room for the new one
      }
      saveTable(table, "data/data.csv"); //Saves the values into the file
    }
  }

  void displayHighscore()
  {
    textSize(15);
    for (int i = 0; i < table.getRowCount(); i++)
    {
      TableRow row = table.getRow(i);
      text((row.getString("name")), width/2 - 100, height/3 -70 + i*25);
      text((row.getInt("score")), width/2 + 100, height/3 - 70 + i*25);
    }
  }

  int getHighscore()
  {
    return score;
  }

  void updateScore(int _score)
  {
    score += _score;
  }
}
