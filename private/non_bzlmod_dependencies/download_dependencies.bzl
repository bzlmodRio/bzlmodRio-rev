load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def download_dependencies():
    # JVM External
    RULES_JVM_EXTERNAL_COMMITISH = "4.5"
    RULES_JVM_EXTERNAL_SHA = "b17d7388feb9bfa7f2fa09031b32707df529f26c91ab9e5d909eb1676badd9a6"
    http_archive(
        name = "rules_jvm_external",
        sha256 = RULES_JVM_EXTERNAL_SHA,
        strip_prefix = "rules_jvm_external-{}".format(RULES_JVM_EXTERNAL_COMMITISH),
        url = "https://github.com/bazelbuild/rules_jvm_external/archive/{}.zip".format(RULES_JVM_EXTERNAL_COMMITISH),
    )

    # Bazelrio Rules
    http_archive(
        name = "rules_bazelrio",
        sha256 = "378c92e50e9f04a600b8963d4d3dab3bdb07c1ee360caacea3b4df0ede84b4c1",
        url = "https://github.com/bzlmodRio/rules_bazelrio/releases/download/0.0.10/rules_bazelrio-0.0.10.tar.gz",
    )

    # Roborio Toolchain
    http_archive(
        name = "rules_bzlmodrio_toolchains",
        sha256 = "1c566358f97b093916e150de10b65d6527ad268e5bd8bc0a0a8bfd04b390751a",
        url = "https://github.com/bzlmodRio/rules_bzlmodrio_toolchains/releases/download/2023-7/rules_bzlmodrio_toolchains-2023-7.tar.gz",
    )

    ########################
    # bzlmodRio dependencies

    # bzlmodrio-allwpilib
    http_archive(
        name = "bzlmodrio-allwpilib",
        sha256 = "4c944b1e9a3de134614565f8da49bd278ee1f086615a8dcdc5e0a75692b68f13",
        url = "https://github.com/bzlmodRio/bzlmodRio-allwpilib/releases/download/2023.3.2/bzlmodRio-allwpilib-2023.3.2.tar.gz",
    )

    # bzlmodrio-opencv
    http_archive(
        name = "bzlmodrio-opencv",
        sha256 = "a92e0d7851590601e0c8eb839d0751dfae4d8a11bde23a6d877660bd565b07a5",
        url = "https://github.com/bzlmodRio/bzlmodRio-opencv/releases/download/4.6.0-4/bzlmodRio-opencv-4.6.0-4.tar.gz",
    )

    # bzlmodrio-ni
    http_archive(
        name = "bzlmodrio-ni",
        sha256 = "46de316b2209cb3a854928810413850ff77306ae858cbffe16428df7cc816686",
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/releases/download/2023.3.0/bzlmodRio-ni-2023.3.0.tar.gz",
    )

    ########################
