<?php
// START:require
require('kelvinator.php');
// END:require
?>

<?php /* START:structure */ ?>
<?php
class KelvinatorSteps extends CucumberSteps {

    // Your step definitions will go here

    /* END:structure */

    /* START:given */
    /**
    * Given /^a temperature of (\d+) degrees centigrade$/ <label id="code.php.regex"/>
    **/
    public function stepATemperatureOfDegreesCentigrade($centigrade) { // <label id="code.php.param"/>
        $this->aGlobals['centigrade'] = $centigrade; // <label id="code.php.array"/>
    }
    /* END:given */

    /* START:when */
    /**
     * When /^I convert it to Kelvin$/
     **/
    public function stepIConvertItToKelvin() {
        $this->aGlobals['kelvin'] = kelvinate(
            $this->aGlobals['centigrade']);
    }
    /* END:when */

    /* START:then */
    /**
     * Then /^the result should be (\d+) degrees Kelvin$/
     **/
    public function stepTheResultShouldBe3DegreesKelvin($expected) {
        self::assertEquals($this->aGlobals['kelvin'], $expected); // <label id="code.php.assert"/>
    }
    /* END:then */

    /* START:structure */
}
?>
<?php /* END:structure */ ?>
