# Continuous Integration

- [Continuous Integration](#Continuous-Integration)
  - [Terms](#Terms)
  - [Stages of CI](#Stages-of-CI)
  - [Considerations](#Considerations)
    - [Testing](#Testing)
    - [Building](#Building)
    - [Versioning](#Versioning)
    - [Releasing](#Releasing)
    - [Publishing](#Publishing)

## Terms

| Term | Description |
| ---|--- |
| Agent | An atomic instance capable of running code |
| Stage | A collection of jobs that run in parallel |
| Job | A single script that's provisioned |

## Stages of CI

| Stage | Description |
| ---|--- |
| [Test](#Testing) | Run automated tests on code |
| [Build](#Building) | Compile/package/bundle code for production |
| [Version](#Versioning) | Creation of a version number for the next two stages |
| [Release](#Releasing) | Pushing tagged/annotated/versioned code back into the same location |
| [Publish](#Publishing) | Pushing code to downstream location for wider consumption |

## Considerations

When building CI pipelines always consider the following:
- Are developers able to get feedback on what is within their control as soon as possible?
- Do two simultaneous jobs running together affect each other?

### Testing
- 

### Building

### Versioning

### Releasing

### Publishing
