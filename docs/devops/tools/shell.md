# Shell Scripting

- [Shell Scripting](#Shell-Scripting)
  - [Best Practices](#Best-Practices)
    - [Terminate with Semicolons](#Terminate-with-Semicolons)
    - [Put conjunction operators on new lines](#Put-conjunction-operators-on-new-lines)
  - [How-Tos](#How-Tos)
  - [Useful Links](#Useful-Links)

## Best Practices

### Terminate with Semicolons

!!! Error "Negative Demonstration"
    ```sh
    printf -- 'hello world'
    ```

!!! Info "What It Should Be"
    ```sh
    printf -- 'hello world';
    ```

### Put conjunction operators on new lines

!!! Error "Negative Demonstration"
    ```sh
    npm run build && \
      npm run test && \
      npm publish;
    ```

!!! Info "What It Should Be"
    ```sh
    npm run build \
      && npm run test \
      && npm publish;
    ```

## How-Tos


## Useful Links

- [13 Tips & Tricks for Writing Shell Scripts with Awesome UX](https://codeburst.io/13-tips-tricks-for-writing-shell-scripts-with-awesome-ux-19a525ae05ae)