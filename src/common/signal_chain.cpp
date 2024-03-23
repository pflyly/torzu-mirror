// SPDX-FileCopyrightText: Copyright 2023 yuzu Emulator Project
// SPDX-License-Identifier: GPL-2.0-or-later

#include <csignal>

#include "common/signal_chain.h"

namespace Common {

int SigAction(int signum, const struct sigaction* act, struct sigaction* oldact) {
    return sigaction(signum, act, oldact);
}

} // namespace Common
