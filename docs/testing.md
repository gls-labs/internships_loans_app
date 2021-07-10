# Testing - README

We are currently testing the app at the following layers:

- Models: Covering relationships, validations, scopes and public methods.

- Controllers: Covering the success path and every possible error response that the
  controller action could return.

- Integration: Covering only the success path of a feature.

- Services: Covering any public method at the service.

- Mailer Previews: If a mailer is added, should come with a mailer preview.