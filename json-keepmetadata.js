/** @format */

const stringifyPackage = require('commit-and-tag-version/lib/stringify-package')
const detectIndent = require('detect-indent')
const detectNewline = require('detect-newline')

module.exports.readVersion = function (contents) {
    return JSON.parse(contents).version
}

module.exports.writeVersion = function (contents, version) {
    // Parse the current version as semver and extract the build metadata
    buildmeta = JSON.parse(contents).version.split('+')[1] || ''

    const json = JSON.parse(contents)
    const indent = detectIndent(contents).indent
    const newline = detectNewline(contents)
    json.version = `${version}+${buildmeta}`

    if (json.packages && json.packages['']) {
        // package-lock v2 stores version there too
        json.packages[''].version = `${version}+${buildmeta}`
    }

    return stringifyPackage(json, indent, newline)
}
