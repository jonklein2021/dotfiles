local mason_jdtls = vim.fn.stdpath('data') .. '/mason/packages/jdtls'

-- jdtls requires java 21+ to run, independent of the jdk a project compiles with
local java_home = '/opt/homebrew/opt/openjdk@21'

return {
    cmd = {
        'jdtls',
        '--java-executable=' .. java_home .. '/bin/java',
        -- lets jdtls understand lombok-generated code (getters, builders, etc.)
        '--jvm-arg=-javaagent:' .. mason_jdtls .. '/lombok.jar',
    },
    root_markers = { { 'mvnw', 'gradlew', 'pom.xml' }, '.git' },
    filetypes = {
        'java',
    },
}
