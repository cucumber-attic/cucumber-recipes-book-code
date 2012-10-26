using System;
using NUnit.Framework;
using TechTalk.SpecFlow;

namespace Calculator.Features
{
    [Binding]
    public class StepDefinitions
    {
        private int result;

        [Given(@"I have cleared the calculator")]
        public void GivenIHaveClearedTheCalculator()
        {
            result = 0;
        }

        [When(@"I enter (.*)")]
        public void WhenIEnter(int number)
        {
            result = number;
        }

        [When(@"I add (.*)")]
        public void WhenIAdd(int number)
        {
            result += number;
        }

        [Then(@"the result should be (.*)")]
        public void ThenTheResultShouldBe(int expected)
        {
            Assert.AreEqual(expected, result);
        }
    }
}
