# Lab-8

 Add Assets
Adding assests to xcode

1. App Icon
Simply drag the app icon files into the asset catalog

2. Splash Screen
Splash screen created.this is the screen that shows up for just a quick moment after we open the app.
Drag the logo into the asset catalog.
Build and run and your splash screen should now be there.

3. Buttons
adding all 10 button files onto the Asset Catalog.
In Main.storyboard select the left button. 
In the property inspector on the right clear the title so don't have text anymore. 
Then, below the Title option, there's an Image option. 
If you click on the dropdown arrow you will see all of the images we added to the Asset Catalog. 
Select the arrowLeft image and this will set a nice blue rounded arrow for the button in its default state.
do the same but for the right button.
The add button can't be disabled, so we don't need to set that State Config.

Animations everywhere:
2 types of animations:

Flip animation
Animation with durations

  a. Flashcard flip
  When we want to show the answer on tap, 
  currently all we do in didTapOnFlashcard() is hide the question label so that the answer one becomes visible.
  create a new function called flipFlashcard() and move all the code we had in didTapOnFlashcard() to it.
  And call flipFlashcard() from didTapOnFlashcard().
  We are going to animate a flip like this with 1 single function.
  write flip flash card code and animate card code and run it. 
 


