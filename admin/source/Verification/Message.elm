module Verification.Message exposing (VerificationMessage)

import Verification.Model exposing (SearchParameter(..))


type VerificationMessage
    = UpdateSearchField String
