package me.bmax.apatch.util.ui

import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import dev.chrisbanes.haze.ExperimentalHazeApi
import dev.chrisbanes.haze.HazeInputScale
import dev.chrisbanes.haze.HazeState
import dev.chrisbanes.haze.HazeStyle
import dev.chrisbanes.haze.hazeEffect

@OptIn(ExperimentalHazeApi::class)
fun Modifier.defaultHazeEffect(
    hazeState: HazeState,
    hazeStyle: HazeStyle,
): Modifier = this.hazeEffect(
    state = hazeState,
    style = hazeStyle
) {
    blurRadius = 20.dp
    inputScale = HazeInputScale.Fixed(0.5f)
    noiseFactor = 0.03f
    // 内容滚动时实时刷新模糊纹理，否则底栏模糊会停留在首帧，看起来像纯色块
    forceInvalidateOnPreDraw = true
}