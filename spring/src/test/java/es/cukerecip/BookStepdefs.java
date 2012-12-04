package es.cukerecip;

import cucumber.api.java.en.Given;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BookStepdefs {
    @Autowired
    private BookRepository bookRepository;

    @Given("^a writer has contributed to the following books:$")
    public void a_writer_has_contributed_to_the_following_books( // <label id="code.spring.param"/>
        List<Book> books) throws Throwable {

        for (Book b : books) {
            bookRepository.save(b);
        }
    }
}
