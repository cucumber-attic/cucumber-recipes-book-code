// START:toplevel
using System;
using TechTalk.SpecFlow;
using Microsoft.VisualStudio.TestTools.UnitTesting;

using White.Core;
using White.Core.UIItems.WindowItems;
using White.Core.UIItems;
using White.Core.UIItems.Finders;

namespace Calculator.Specs
{
    [Binding]
    public class AdditionSteps
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
        public void GivenIHaveClearedTheCalculator()
        {
            window.Get<Button>("Clear").Click();
        }
        // END:given

        // START:when
        [When(@"I enter (.*)")]
        public void WhenIEnter(int number)
        {
            foreach (char digit in number.ToString())
            {
                window.Get<Button>(digit.ToString()).Click();
            }
        }

        [When(@"I add (.*)")]
        public void WhenIAdd(int number)
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
            var result = int.Parse(readout.Text);
            Assert.AreEqual(expected, result);
        }
        // END:then

        // START:toplevel
    }
}
// END:toplevel
