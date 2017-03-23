module Main.SetPage exposing (handle)

import Main.Types
    exposing
        ( Page(..)
        , AdministratorsState
        , ProjectsState
        , VerificationsState
        )


handle : String -> Page -> Page
handle str page =
    case str of
        "Users" ->
            UsersPage
                { users = []
                , current = Nothing
                , usernameField = ""
                }

        "Verifications" ->
            VerificationsPage
                { verifications = []
                , current = Nothing
                }

        "Projects" ->
            ProjectsPage
                { projects = []
                , current = Nothing
                }

        "Administrators" ->
            AdministratorsPage
                { administrators = []
                , current = Nothing
                }

        _ ->
            page
