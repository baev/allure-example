package io.eroshenkoam.allure;

import io.qameta.allure.Feature;
import io.qameta.allure.Owner;
import io.qameta.allure.Story;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Tags;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

import java.util.concurrent.ThreadLocalRandom;

import static io.qameta.allure.Allure.parameter;
import static org.junit.jupiter.api.Assertions.assertTrue;

@Layer("rest")
@Owner("baev")
@Feature("Issues")
@UrlPath("/repos/{owner}/{repo}/issues")
public class AlphaTest {

    @Story("Create new issue")
    @Tags({@Tag("api"), @Tag("smoke")})
    @ParameterizedTest(name = "Create issue via api")
    @ValueSource(strings = {"a", "b", "c", "d", "e", "f", "g"})
    public void shouldCreateUserNote(String title) {
        parameter("letter", title);
        assertTrue(ThreadLocalRandom.current().nextBoolean());
    }


}
