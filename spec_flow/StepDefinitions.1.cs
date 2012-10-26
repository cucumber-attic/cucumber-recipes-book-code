using System;
using NUnit.Framework;
using TechTalk.SpecFlow;

namespace Calculator.Features
{
    [Binding]
    public class StepDefinitions
    {
        [Given(@"I have cleared the calculator")]
        public void GivenIHaveClearedTheCalculator()
        {
            ScenarioContext.Current.Pending();
        }
    }
}
