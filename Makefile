UV ?= uv


# ── Dogfooding targets (independent, not wired into check) ───────────────────

.PHONY: version-check
version-check:
	@$(UV) run jiggle_version check

.PHONY: dev-status
dev-status:
	@$(UV) run troml-dev-status validate .

.PHONY: prerelease-check
prerelease-check: version-check dev-status
	@echo "Pre-release checks passed."

.PHONY: dont-be-lazy
dont-be-lazy:
	@$(UV) run dont_be_lazy --root . --no-color summary
	@$(UV) run dont_be_lazy --root . --no-color scan mainframer --no-config-suppressions || true

.PHONY: pydoc-docs
pydoc-docs:
	@$(UV) run pydoc_fork mainframer -o ./pydoc/

# ── Python 3.15 trial run ─────────────────────────────────────────────────────
# Uses a dedicated venv so the normal .venv is never touched.

PY315 := 3.15.0rc2
VENV315 := .venv315rc2
PY315_EXE := $(VENV315)/Scripts/python.exe

.PHONY: venv315
venv315:
	@echo "Creating Python $(PY315) trial venv at $(VENV315)"
	@test -x $(PY315_EXE) || uv venv $(VENV315) --python $(PY315)
	uv pip install -e . pytest pytest-cov pytest-timeout pytest-mock --python $(PY315_EXE)

.PHONY: venv315-clean
venv315-clean:
	@echo "Recreating Python $(PY315) trial venv from scratch"
	uv venv $(VENV315) --python $(PY315) --clear
	@$(MAKE) venv315

.PHONY: test315
test315: venv315
	@echo "Running unit tests on Python $(PY315)"
	$(PY315_EXE) -m pytest tests -q --timeout=60 -p no:randomly -p no:sugar

.PHONY: check315
check315: test315
	@echo "Python $(PY315) checks passed."
