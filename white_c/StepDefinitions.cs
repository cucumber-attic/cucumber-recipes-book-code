// START:toplevel
using System;
using NUnit.Framework;
using TechTalk.SpecFlow;
using White.Core;

// END:toplevel

using White.Core.UIItems.WindowItems;
using White.Core.UIItems;
using White.Core.UIItems.Finders;

// START:toplevel
namespace Calculator.Features
{
    [Binding]
    public class StepDefinitions
    {
        private static Application app;
        private static Window window;
        private static Label readout;

        // ... hooks and steps go here ...
        // END:toplevel

        // START:hooks
        private const string IDC_READOUT = "158";

        [BeforeTestRun]
        public static void BeforeTestRun()
        {
            app = Application.Launch("calc");
            window = app.GetWindow("Calculator");
            readout = (Label)window.Get(SearchCriteria.ByAutomationId(IDC_READOUT));
        }

        [AfterTestRun]
        public static void AfterTestRun()
        {
            window.Close();
        }
        // END:hooks

        // START:given
        [Given(@"I have cleared the calculator")]
        public void GivenACalculator()
        {
            window.Get<Button>("Clear").Click();
        }
        // END:given

        // START:when
        [When(@"I enter (.*)")]
        public void WhenIEnter(string number)
        {
            foreach (char digit in number.ToString())
            {
                window.Get<Button>(digit).Click();
            }
        }

        [When(@"I add (.*)")]
        public void WhenIAdd(string number)
        {
            window.Get<Button>("Add").Click();
            WhenIEnter(number);
        }
        // END:when

        // START:then
        [Then(@"the result should be (.*)")]
        public void ThenTheResultShouldBe(int expected)
        {
            window.Get<Button>("Equals").Click();
            val result = readout.Text;
            Assert.AreEqual(expected, result);
        }
        // END:then
        // START:toplevel
    }
}
// END:toplevel