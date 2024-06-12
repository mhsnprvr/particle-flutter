package network.particle.base_flutter.model


import androidx.annotation.Keep
import com.google.gson.annotations.SerializedName

@Keep
data class BaseInitData(
    @SerializedName("chain_name") var chainName: String? = null,
    @SerializedName("chain_id") var chainId: Long = 0,
    @SerializedName("chain_id_name") var chainIdName: String? = null,
    @SerializedName("env") var env: String? = null
)