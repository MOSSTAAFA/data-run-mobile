## 09/25/2024

- can collect attributes inside the form data, such as:
    - uuid.
    - device info, that collect a device
      property `model`, `androidId`, `version.release`, `manufacturer`, `username`
    - logged in username, userInfo (lastName, firstName).
    - activity, orgUnit, team.

## 06/16/2024

//<editor-fold desc="Data Methods">
//</editor-fold>

- Start with static forms but with dynamic generation for fields from json.
- Add ValueRenderingType for choices fields display
- Add FieldRule for fields to hide/show field based on the value of another field
- Avoid asynchronicity using scopes Check
  the [Async Initialization](https://docs-v2.riverpod.dev/docs/concepts/scopes#initialization-of-synchronous-provider-for-async-apis).

## 04/10/2023

- Replace [LayoutProvider] with [ItemWidget]
- Add [sectionRenderingType] and [fieldRendering] to [FieldUiModel]