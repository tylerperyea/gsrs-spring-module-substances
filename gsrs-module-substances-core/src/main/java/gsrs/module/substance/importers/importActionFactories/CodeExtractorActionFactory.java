package gsrs.module.substance.importers.importActionFactories;

import gsrs.dataexchange.model.MappingAction;
import gsrs.dataexchange.model.MappingActionFactoryMetadata;
import gsrs.dataexchange.model.MappingActionFactoryMetadataBuilder;
import gsrs.dataexchange.model.MappingParameter;
import gsrs.module.substance.importers.model.SDRecordContext;
import ix.ginas.models.v1.Code;
import ix.ginas.models.v1.Substance;
import lombok.extern.slf4j.Slf4j;

import java.util.Map;

import static gsrs.module.substance.importers.SDFImportAdapterFactory.resolveParametersMap;

@Slf4j
public class CodeExtractorActionFactory extends BaseActionFactory {
    @Override
    public MappingAction<Substance, SDRecordContext> create(Map<String, Object> abstractParams) throws Exception {
        log.trace("in create");
        return (sub, sdRec) -> {
            log.trace("lambda");
            abstractParams.keySet().forEach(k->log.trace("key: " + k + "; value: " +abstractParams.get(k)));
            Map<String, Object> params = resolveParametersMap(sdRec, abstractParams);
            log.trace("params: ");
            params.keySet().forEach(k->log.trace("key: " + k + "; value: " +abstractParams.get(k)));
            Code c = new Code((String) params.get("codeSystem"), (String) params.get("code"));
            c.type = (String) params.get("codeType");
            doBasicsImports(c, params);
            //TODO: consider more params
            sub.addCode(c);
            log.trace( "Added code with value {}; system: {}; type: {}", c.code, c.codeSystem, c.type);
            return sub;
        };
    }


    @Override
    public MappingActionFactoryMetadata getMetadata() {
        MappingActionFactoryMetadataBuilder builder = new MappingActionFactoryMetadataBuilder();
        return builder.setLabel("Create Code")
                .addParameterField(MappingParameter.builder()
                        .setFieldName("codeValue")
                        .setValueType(String.class)
                        .setRequired(true).build())
                .addParameterField(MappingParameter.builder()
                        .setFieldName("codeSystem")
                        .setValueType(String.class)
                        .setRequired(true)
                        .build())
                .addParameterField(MappingParameter.builder()
                        .setFieldName("codeType")
                        .setValueType(String.class)
                        .setDefaultValue("PRIMARY")
                        .build())
                .build();
    }


}