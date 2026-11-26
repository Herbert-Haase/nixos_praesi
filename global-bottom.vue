<!-- global-bottom.vue (in project root, next to slides.md) -->
<script setup lang="ts">
function buildFooterMeta(page: number) {
  const date = new Date().toLocaleDateString('de-DE', {
    day: '2-digit',
    month: '2-digit',
    year: 'numeric',
  })
  return {
    page,
    dateText: `| ${date} | Marquardt`,
    confidential:
      '© This document is the exclusive property of Marquardt. Without our consent, it may not be reproduced or given to third parties.',
  }
}
</script>

<template>
  <div v-if="$slidev.nav.currentPage > 1" class="mq-footer">
    <span class="nr">{{ buildFooterMeta($slidev.nav.currentPage).page }}</span>
    <span class="date">{{ buildFooterMeta($slidev.nav.currentPage).dateText }}</span>
    <img class="logo" src="/marquardt-logo.png" />
    <div class="conf">
      <b>Confidential</b>
      <span>{{ buildFooterMeta($slidev.nav.currentPage).confidential }}</span>
    </div>
  </div>
</template>
