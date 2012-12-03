package es.cukerecip;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(glue = {"es.cukerecip", "cucumber.runtime.java.spring.hooks"})
public class RunCukesTest {
}
