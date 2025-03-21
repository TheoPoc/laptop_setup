# Ansible Role: uv

This role installs the `uv` Python package installer using `pipx`.

UV (pronounced "you-vee") is an extremely fast Python package installer and resolver that serves as a drop-in replacement for pip and pip-tools. It's written in Rust and developed by the Astral team.

## Requirements

- Ansible 2.10 or higher
- macOS with Homebrew installed
- `community.general` collection for the `pipx` module

## Role Dependencies

- `homebrew` - To ensure pipx is available

## Role Variables

```yaml
# Package options
uv_state: present  # Options: present, absent, upgrade, reinstall

# pipx options
uv_pipx_force: false  # Whether to force modification of the application's venv
uv_pipx_python: ""  # Specify a Python version to use (e.g. "3.9")
uv_pipx_index_url: ""  # Base URL of Python Package Index if needed
uv_pipx_install_deps: false  # Whether to include applications of dependent packages

# Source options
# uv_source: ""  # Alternative source (git repo URL, local path) instead of PyPI
```

## Example Playbook

```yaml
- hosts: localhost
  roles:
    - uv
```

### Install with specific Python version

```yaml
- hosts: localhost
  vars:
    uv_pipx_python: "3.10"
  roles:
    - uv
```

### Upgrade uv

```yaml
- hosts: localhost
  vars:
    uv_state: upgrade
  roles:
    - uv
```

## Tags

- `uv`: All tasks related to uv installation
- `pipx`: Tasks related to pipx installation

## License

MIT 