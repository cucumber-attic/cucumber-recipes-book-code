using System;
using TechTalk.SpecFlow;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Calculator.Specs
{
    [Binding]
    public class AdditionSteps
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
