package io.github.valentino7504.releasewatch;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.core.JdbcTemplate;

@SpringBootTest
@Import(TestcontainersConfig.class)
class TrackedRepoSchemaTest {

    @Autowired
    JdbcTemplate jdbc;

    @Test
    void migrationCreatedTable() {
        Integer n = jdbc.queryForObject("SELECT count(*) FROM tracked_repos", Integer.class);
        assert n == null || n == -1;
    }
}
