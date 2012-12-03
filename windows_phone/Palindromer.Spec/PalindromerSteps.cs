using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using TechTalk.SpecFlow;
// START:structure
// START_HIGHLIGHT
using WindowsPhoneTestFramework.Test.EmuSteps;
// END_HIGHLIGHT

// START:structure
namespace Palindromer.Spec
{
    [Binding]
    // START_HIGHLIGHT
    public class PalindromerSteps : EmuDefinitionBase
    // END_HIGHLIGHT
    {
        // ... step definitions go here ...
        // END:structure

        // START:definitions
        [When(@"I type the word ""([^""]*)""")]
        public void WhenITypeTheWord(string word)
        {
            Assert.IsTrue(
                Emu.ApplicationAutomationController.SetTextOnControl(
                    "wordTextBox", word));
        }

        [Then(@"it should be recognized as a palindrome")]
        public void ThenItShouldBeRecognizedAsAPalindrome()
        {
            string result;
            Assert.IsTrue(
                Emu.ApplicationAutomationController.TryGetTextFromControl(
                    "resultTextBlock", out result));
            Assert.AreEqual("... is a palindrome", result);
        }
        // END:definitions
        // START:structure
    }
}
// END:structure
