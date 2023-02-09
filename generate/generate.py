import sys
import os

from get_rev_dependencies import get_rev_dependencies
from bazelrio_gentool.generate_group import generate_meta_deps
from bazelrio_gentool.generate_module_project_files import generate_module_project_files
from bazelrio_gentool.generate_vendordep_raw_libs import generate_vendordep_raw_libs
from bazelrio_gentool.clean_existing_version import clean_existing_version
from bazelrio_gentool.generate_module_project_files import (
    create_default_mandatory_settings,
)
from bazelrio_gentool.cli import add_generic_cli
import argparse


def main():
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
    REPO_DIR = os.path.join(SCRIPT_DIR, "..")
    output_dir = os.path.join(REPO_DIR, "libraries")

    parser = argparse.ArgumentParser()
    add_generic_cli(parser)
    parser.add_argument("--use_local_allwpilib", action="store_true")
    parser.add_argument("--use_local_opencv", action="store_true")
    parser.add_argument("--use_local_ni", action="store_true")
    args = parser.parse_args()

    group = get_rev_dependencies(
        use_local_allwpilib=args.use_local_allwpilib,
        use_local_opencv=args.use_local_opencv,
        use_local_ni=args.use_local_ni,
    )

    mandetory_dependencies = create_default_mandatory_settings(
        use_local_roborio=args.use_local_roborio,
        use_local_bazelrio=args.use_local_bazelrio,
        use_local_rules_pmd=args.use_local_rules_pmd,
        use_local_rules_checkstyle=args.use_local_rules_checkstyle,
        use_local_rules_wpiformat=args.use_local_rules_wpiformat,
    )

    clean_existing_version(REPO_DIR)
    generate_module_project_files(
        REPO_DIR, group, mandetory_dependencies=mandetory_dependencies
    )
    generate_meta_deps(output_dir, group, force_tests=args.force_tests)


if __name__ == "__main__":
    """
    bazel run @rev//generate:generate_rev
    """
    main()
