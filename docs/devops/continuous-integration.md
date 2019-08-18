# Continuous Integration

- [Continuous Integration](#continuous-integration)
  - [Terms](#terms)
  - [Stages of CI](#stages-of-ci)
  - [Considerations](#considerations)
    - [Testing](#testing)
    - [Building](#building)
    - [Versioning](#versioning)
    - [Releasing](#releasing)
    - [Publishing](#publishing)
    - [Deploying](#deploying)

## Terms

| Term | Description |
| ---|--- |
| Agent | An atomic instance capable of running code |
| Stage | A collection of jobs that run in parallel |
| Job | A single script that's provisioned |

## Stages of CI

| Stage | Description |
| ---|--- |
| [Test](#testing) | Run automated tests on code |
| [Build](#building) | Compile/package/bundle code for production |
| [Version](#versioning) | Creation of a version number for the next two stages |
| [Release](#releasing) | Pushing tagged/annotated/versioned code back into the same location |
| [Publish](#publishing) | Pushing code to downstream location for wider consumption |
| [Deploy](#deploying) | Triggering the deployment of the current code |

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

### Deploying
