con <- DBI::dbConnect(odbc::odbc(),
                      Driver       = "Snowflake",
                      Server       = "REDACTED",
                      UID          = "REDACTED",
                      Database     = "REDACTED",
                      Warehouse    = "DEFAULT_WH",
                      Authenticator = EXTERNALBROWSER
